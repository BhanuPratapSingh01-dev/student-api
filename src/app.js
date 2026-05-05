require("dotenv").config({
  path: process.env.NODE_ENV === "development" ? ".env.local" : ".env"
});

const express = require("express");
const connectDB = require("./config/db");
const logger = require("./utils/logger");

const app = express();

// middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// health check
app.get("/health", (req, res) => {
  return res.status(200).json({
    status: "UP",
    message: "Server is running",
    timestamp: new Date()
  });
});

// ✅ DB connection only when NOT testing
if (process.env.NODE_ENV !== "test") {
  connectDB();
}

// routes
app.use("/api/v1/users", require("./routes/userRoutes"));

// start server ONLY if not testing
const PORT = process.env.PORT || 8000;

if (process.env.NODE_ENV !== "test") {
  logger.info("Server starting...");
  app.listen(PORT, () => {
    console.log(`Server Started at PORT:${PORT}`);
  });
}

module.exports = app;