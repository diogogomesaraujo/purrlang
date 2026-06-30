module Main where

import Test.HUnit
import Parse

tests :: [Test]
tests = parseTests

main :: IO ()
main = do
    _ <- runTestTT $ TestList tests
    return ()
