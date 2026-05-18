require("dotenv").config({
  path:
    process.env.NODE_ENV === "development"
      ? ".env.local"
      : ".env"
});

const express = require("express");
const os = require("os");

const connectDB = require("./config/db");
const logger = require("./utils/logger");

const app = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Health Check Route
app.get("/health", (req, res) => {
  return res.status(200).json({
    status: "UP",
    message: "Server is running",

    // Shows container name for load balancing verification
    container:
      process.env.CONTAINER_NAME || os.hostname(),

    timestamp: new Date()
  });
});

// Connect DB only when NOT testing
if (process.env.NODE_ENV !== "test") {
  connectDB();
}

// Routes
app.use("/api/v1/users", require("./routes/userRoutes"));

// Server Config
const PORT = process.env.PORT || 8000;

// Start server only when NOT testing
if (process.env.NODE_ENV !== "test") {
  console.log("GitOps Pipeline Test");
  logger.info("Starting server...");g

  app.listen(PORT, "0.0.0.0", () => {
    logger.info(`Server running on PORT ${PORT}`);
    console.log(`Server running on PORT ${PORT}`);
  });
}

module.exports = app;