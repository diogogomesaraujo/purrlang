module Main (main) where

import Parser
import Lexer

main :: IO ()
main = do
  parsed <- return $ parse $ alexScanTokens "let x := 3 + 2 in x"
  putStr $ show parsed
