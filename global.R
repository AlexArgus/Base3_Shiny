library(RDS)
library(shiny)
require(shinythemes)
require(data.table)
library(dygraphs)
require(xts)


##

# Transactions <- readRDS('C:/Users/Alexandr/Desktop/Антон Супрун/ДД/Machine Learning/Базы III/Transactions.rds')

Sys.setlocale("LC_ALL","Russian")

Transactions <- readRDS('FinalTransactions.rds')

Points <- Transactions[Point != "" , unique(Point)]

Cites <- c('Новосибирск', 'Бердск', 'Искитим')

Periods <- c('days', 'weeks', 'months')

