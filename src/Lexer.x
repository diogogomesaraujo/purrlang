{
module Lexer where
}

%wrapper "basic"

$whitespace = [ \t\n\r\f\y]
$digit      = [0-9]
$large      = [A-Z]
$small      = [a-z \_]
$alpha      = [$small $large]

@int   = -?$digit+
@float = -?$digit+ "." $digit+

tokens :-
    $white+                       ;
    "--".*                        ;
    let                           { \s -> TokenLet }
    in                            { \s -> TokenIn }
    if                            { \s -> TokenIf }
    @int                          { \s -> TokenInt (read s) }
    @float                        { \s -> TokenFloat (read s) }
    $alpha [$alpha $digit \_ \']* { \s -> TokenVar s }


{
data Token = TokenFix
           | TokenLet
           | TokenIf
           | TokenThen
           | TokenElse
           | TokenFn
           | TokenIn
           | TokenInt Int
           | TokenFloat Float
           | TokenVar String
           | TokenTrue
           | TokenFalse
           | TokenAssign
           | TokenArrow
           | TokenPlus
           | TokenMinus
           | TokenTimes
           | TokenDiv
           | TokenLPar
           | TokenRPar
           | TokenMore
           | TokenMoreEqual
           | TokenLess
           | TokenLessEqual
           | TokenEquals
           | TokenDifferent
           | TokenAnd
           | TokenOr
}
