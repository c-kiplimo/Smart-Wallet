package route

import (
	"github.com/gin-gonic/gin"
	"github.com/c-kiplimo/Smart-Wallet/internal/handler"
	"github.com/c-kiplimo/Smart-Wallet/internal/middleware"
)

func (r *Router) User(route *gin.RouterGroup, h *handler.Handler) {
	route.GET("/balance", middleware.AuthMiddleware(r.jwtService, r.userService), h.Profile)
}
