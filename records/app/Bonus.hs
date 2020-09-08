module Main where

import Optics
import Optics.TH

data Pet = Pet { petName :: String, petAge :: Int} deriving Show

makeFields ''Pet

data Person = Person { personName :: String, personPets :: [Maybe Pet]} deriving Show

makeFields ''Person

main = do
  let codygman = Person "codygman" [ Nothing, Just (Pet "doggo" 1), Just (Pet "catto" 3)]
  print $ codygman & pets % mapped % mapped % age %~ (+1)
  putStrLn "hi"
