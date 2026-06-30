module Parse where

import Test.HUnit
import Parser
import Lexer
import Ast

parseTests :: [Test]
parseTests = [testIncr]

testIncr :: Test
testIncr =
    let incrStr  = "let incr := fn x -> x + 1 in incr 1"
        incrTerm = Let "incr"
                    (Lambda "x" $ Var "x" :+ (Const $ CInt 1))
                    (App (Var "incr") (Const $ CInt 1))
    in TestCase $ assertEqual
        "lex and parse \"let incr := fn x -> x + 1 in incr 1\""
        (parse $ alexScanTokens incrStr)
        incrTerm
