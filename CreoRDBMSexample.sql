
USE master
GO
--Example create database
IF NOT EXISTS (
    SELECT name
FROM sys.databases
WHERE name = N'Pippo'
)
CREATE DATABASE Pippo
GO



USE Pippo
GO
--create tables
IF OBJECT_ID('TbRecipeIngredients', 'U') IS NOT NULL
DROP TABLE TbRecipeIngredients
GO

CREATE TABLE TbRecipeIngredients
(
    IDRecipeIngredient INT NOT NULL PRIMARY KEY,
    IDRecipe [INT] NOT NULL,
    IDIngredient [INT] NOT NULL,
    Quantity [INT],
    LastUpDate [DATETIME]
);
GO

IF OBJECT_ID('TbRecipes', 'U') IS NOT NULL
DROP TABLE TbRecipes
GO

CREATE TABLE TbRecipes
(
    IDRecipe INT NOT NULL PRIMARY KEY,
    Preparation [NVARCHAR](50) NOT NULL,
    LastUpDate [DATETIME]

);
GO

IF OBJECT_ID('TbIngredients', 'U') IS NOT NULL
DROP TABLE TbIngredients
GO

CREATE TABLE TbIngredients
(
    IDIngredient INT NOT NULL PRIMARY KEY,
    Ingredient [NVARCHAR](50) NOT NULL,
    IDMeasureUnit [INT] NOT NULL,
    LastUpDate [DATETIME]

);
GO

IF OBJECT_ID('TbMeasureUnits', 'U') IS NOT NULL
DROP TABLE TbMeasureUnits
GO

CREATE TABLE TbMeasureUnits
(
    IDMeasureUnit INT NOT NULL PRIMARY KEY,
    Description [NVARCHAR](50) NOT NULL,
    IDMeasureUnitTo [INT] NOT NULL,
    ConversionMultiplier [INT],
    LastUpDate [DATETIME]
);
GO


IF OBJECT_ID('TbRecipeLinks', 'U') IS NOT NULL
DROP TABLE TbRecipeLinks
GO

CREATE TABLE TbRecipeLinks
(
    IDRecipeLink INT NOT NULL PRIMARY KEY,
    IDRecipe [INT] NOT NULL,
    Link [NVARCHAR](50) NOT NULL,
    LastUpDate [DATETIME]
);
GO

IF OBJECT_ID('TbVersion', 'U') IS NOT NULL
DROP TABLE TbVersion
GO

CREATE TABLE TbVersion
(
    IDVersion INT NOT NULL PRIMARY KEY,
    UpDateData [DATETIME] NOT NULL,
    UpDateDescription [DATETIME] NOT NULL,
    PrgVersion [NVARCHAR](50),
    SysUser [NVARCHAR](50)
);
GO