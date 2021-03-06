{-# LANGUAGE Haskell2010, TemplateHaskell, FlexibleContexts #-}

import Data.NamedRecord

names "firstName" "lastName"

record "User"
    `has` "accountId" := ''Integer
    `has` "firstName" := ''String
    `has` "lastName"  := ''String

record "Person"
    `has` "firstName" := ''String
    `has` "lastName"  := ''String


displayName :: (Property o $(nameT "firstName") String,
                Property o $(nameT "lastName")  String)
            => o -> String
displayName obj = (obj `get` firstName) ++ " " ++ (obj `get` lastName)

