package route

import (
	"github.com/gin-gonic/gin"
	"github.com/c-kiplimo/Smart-Wallet/internal/handler"
)

func (r *Router) Auth(route *gin.RouterGroup, h *handler.Handler) {
	route.POST("/sign-up", h.Register)
	route.POST("/sign-in", h.Login)
	route.POST("/forgot-password", h.ForgotPassword)
	route.POST("/reset-password", h.ResetPassword)
}
