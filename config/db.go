package config

import (
	"github.com/c-kiplimo/Smart-Wallet/internal/model"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

type DBResult struct {
	Result *gorm.DB
	Error error
}

func Connect() *gorm.DB{
	dsn := "postgres://postgres:postgres@localhost:5432/smart_wallet"
    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if  err != nil {
		panic(err)
	}
	err = db.AutoMigrate(&model.User{},&model.PasswordReset{},&model.Wallet{},&model.SourceOfFund{},&model.Transaction{})
	
	if err != nil {
		panic(err)
	}
	DB = db
	return db
	}
	func GetSecretKey() string {
		return "your_secret_key_here"
	}
