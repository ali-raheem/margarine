import Data.Char
import Data.List
import Data.List.Split
import Data.Ord
import System.Environment
import System.IO

wordsToList = makeDict . lines
toAlpha = filter isAlpha
wordToLower = map toLower
wordsToAlpha = map toAlpha

mungWord = sort . wordToLower 
mungWordList = map mungWord
mungKey = mungWord . toAlpha

findWordInList list key = [word | (k, word) <- list, k == key]

makeDict x = zip (mungWordList lettersOnly) x
             where lettersOnly = wordsToAlpha x

getUserQuery = do
       putStr "Enter letters: "
       hFlush stdout
       getLine
       
main = do
       fileName:_ <- getArgs
       words <- readFile $ fileName
       needle <- getUserQuery
       mapM_ putStrLn $ findWordInList (wordsToList words) $ mungKey needle
