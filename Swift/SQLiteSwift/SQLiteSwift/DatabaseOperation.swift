//
//  DatabaseOperation.swift
//  SQLiteSwift
//
//  Created by Vinita Miranda on 5/15/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class DatabaseOperation: NSObject {
   

    
    class func initialiseDatabase()
    {
        let filemgr = NSFileManager.defaultManager()
 
        if !filemgr.fileExistsAtPath(DatabaseOperation.getDatabasePath() as String) {
            
            let drinksDb = FMDatabase(path: DatabaseOperation.getDatabasePath() as String)
            
            if drinksDb == nil {
                println("Error: \(drinksDb.lastErrorMessage())")
            }
            
            if drinksDb.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS DRINKS (ID INTEGER PRIMARY KEY AUTOINCREMENT, CATEGORY TEXT, INGREDIENTS TEXT, NAME TEXT,INSTRUCTIONS TEXT)"
                if !drinksDb.executeStatements(sql_stmt) {
                    println("Error: \(drinksDb.lastErrorMessage())")
                }
                drinksDb.close()
            } else {
                println("Error: \(drinksDb.lastErrorMessage())")
            }
        }
    }
    
    class func getDatabasePath() -> String
    {
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let docsDir = dirPaths[0] as! String
        return docsDir.stringByAppendingPathComponent("drinks.db")
    }
    
    class func saveDrink(drink : Dictionary<String,String>)
    {
        let drinkDb = FMDatabase(path: DatabaseOperation.getDatabasePath() as String)
        
        if drinkDb.open() {
            
            var category = drink["category"]! as String
            var ingrediant = drink["ingredients"]! as String
            var name = drink["name"]! as String
            var instructions = drink["instructions"]! as String
            
            let insertSQL = "INSERT INTO DRINKS (category, ingredients, name, instructions) VALUES ('\(category)', '\(ingrediant)', '\(name)', '\(instructions)')"
            
            let result = drinkDb.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                println("Error: \(drinkDb.lastErrorMessage())")
            } else {
                
            }
        } else {
            println("Error: \(drinkDb.lastErrorMessage())")
        }
    }
    
    
    class func getAllDrinksFromDB() -> [Drink]
    {
        let drinkDB = FMDatabase(path: DatabaseOperation.getDatabasePath() as String)
        
        var resultsArray = [Drink]()
        
        if drinkDB.open() {
            let querySQL = "SELECT * from DRINKS"
            
            let results: FMResultSet? = drinkDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            while results?.next() == true {
                var drink = Drink()
                drink.name = results!.stringForColumn("name")
                drink.category = results?.stringForColumn("category")
                drink.ingredients = results?.stringForColumn("ingredients")
                drink.instructions = results?.stringForColumn("instructions")
                resultsArray.append(drink)

            } 
            drinkDB.close()
        } else {
            println("Error: \(drinkDB.lastErrorMessage())")
        }
        return resultsArray
    }
}
