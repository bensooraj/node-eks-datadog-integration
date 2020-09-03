'use strict';

const express = require('express');
const winston = require('winston');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();

const logger = winston.createLogger({
    transports: [
        new winston.transports.Console({
            handleExceptions: true,
        })
    ],
    level: 'debug',
    exitOnError: false,
    format: winston.format.combine(
        winston.format.splat(),
        winston.format.timestamp(),
        winston.format.json()
    ),
});

app.get('/', (req, res) => {
    logger.silly("This is a silly message", { url: req.url, environment: "test" });
    logger.debug("This is a debug message", { url: req.url, environment: "test" });
    logger.info("This is an info message", { url: req.url, environment: "test" });

    res.json({
        response_message: 'Hello World'
    });
});

app.listen(PORT, HOST);
logger.info("Running on http://${HOST}:${PORT}", { host: HOST, port: PORT, environment: "test" });
