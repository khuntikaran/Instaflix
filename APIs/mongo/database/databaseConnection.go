package database

import (
	"context"
	"fmt"
	"log"

	"os"

	"github.com/joho/godotenv"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func ConnectDB() *mongo.Collection {
	err := godotenv.Load()
	if err != nil {
		log.Fatal(err)
	}
	MongoDb := os.Getenv("MONGODB_URL")
	// Set client options
	clientOptions := options.Client().ApplyURI(MongoDb)

	// Connect to MongoDB
	client, err := mongo.Connect(context.TODO(), clientOptions)

	if err != nil {
		fmt.Println("error aavo")
		log.Fatal(err)
	}

	fmt.Println("Connected to MongoDB!")

	collection := client.Database("movies").Collection("movie")
	fmt.Println("thay gyu bhai")

	return collection
}
