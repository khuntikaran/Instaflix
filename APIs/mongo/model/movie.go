package model

import "go.mongodb.org/mongo-driver/bson/primitive"

type Movie struct {
	ID          primitive.ObjectID `json:"_id,omitempty" bson:"_id,omitempty"`
	Name        string             `json:"name" bson:"name,omitempty"`
	Description string             `json:"description" bson:"description,omitempy"`
	Image       string             `json:"image" bson:"image,omitempty"`
	Director    string             `json:"director" bson:"director,omitempty"`
	Imdb        string             `json:"imdb" bson:"imdb,omitempty"`
	Stars       []string           `json:"stars" bson:"stars,omitempty"`
	Duration    string             `json:"duration" bson:"duration,omitempty"`
	Category    []string           `json:"category" bson:"category,omitempty"`
	StarImage   []string           `json:"starimage" bson:"starimage,omitempty"`
}
