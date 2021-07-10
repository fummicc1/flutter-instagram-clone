package models

type User struct {
	ID               string
	Name             string
	Avatar           []byte
	NumberOfFollower int
	NumberOfFollowee int
}
