var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");

var indexRouter = require("./routes/index");
var postsRouter = require("./routes/posts");

var swaggerUi = require("swagger-ui-express");
var swaggerJsdoc = require("swagger-jsdoc");

var app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// Swagger setup
const swaggerOptions = {
  definition: require("./swagger.json"),
  apis: ["./routes/*.js"],
};
const swaggerDocs = swaggerJsdoc(swaggerOptions);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocs));

app.use("/", indexRouter);
app.use("/api/posts", postsRouter);

module.exports = app;
