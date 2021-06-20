package controller

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"mongo/mongo/database"
	"mongo/mongo/model"
	"net/http"

	"github.com/gorilla/mux"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

var movieCollection = database.ConnectDB()

func GetMovies(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-Type", "application/json")
	var movies []model.Movie
	response, err := movieCollection.Find(context.TODO(), bson.M{})

	if err != nil {
		fmt.Println("aaaaaaaaa")
		log.Fatal(err)
	}
	defer response.Close(context.TODO())
	for response.Next(context.TODO()) {
		var movie model.Movie
		err = response.Decode(&movie)
		if err != nil {
			log.Fatal(err)
			fmt.Println("aaaaaabbbbbbbb")
		}

		movies = append(movies, movie)
	}
	json.NewEncoder(w).Encode(movies)

}

func GetMovie(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-Type", "application/json")
	var movie model.Movie
	param := mux.Vars(r)

	id, _ := primitive.ObjectIDFromHex(param["id"])
	filter := bson.M{"_id": id}
	err := movieCollection.FindOne(context.TODO(), filter).Decode(&movie)

	if err != nil {
		log.Fatal(err)
	}

	json.NewEncoder(w).Encode(movie)

}

func AddMovie(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-Type", "application/json")
	var movie model.Movie

	err := json.NewDecoder(r.Body).Decode(&movie)

	if err != nil {
		log.Fatal(err)
	}
	result, err := movieCollection.InsertOne(context.TODO(), movie)

	if err != nil {
		log.Fatal(err)
	}

	json.NewEncoder(w).Encode(result)

}

func DeleteMovie(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Content-Type", "application/json")
	//	var movie model.Movie

	param := mux.Vars(r)
	id, err := primitive.ObjectIDFromHex(param["id"])
	filter := bson.M{"_id": id}

	result, err := movieCollection.DeleteOne(context.TODO(), filter)
	if err != nil {
		log.Fatal(err)
	}
	json.NewEncoder(w).Encode(result)

}
