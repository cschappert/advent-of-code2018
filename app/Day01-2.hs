module Main where

import Control.Lens
import Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString
import Data.Text (Text)
import qualified Data.Text as Text

import Data.Set (Set)
import qualified Data.Set as Set

-- You can import from shared modules defined in src/.
import Lib (someFunc)

main :: IO ()
main =
  interact mySolution

-- | This is a function that has been passed to interact above.
--
-- Tests:
-- >>> mySolution "+1\n+1\n-3"
-- "0"
-- >>> mySolution "+1\n-1\n"
-- "0"
-- >>> mySolution "+3\n+3\n+4\n-2\n-4\n"
-- "10"
-- >>> mySolution "-6\n+3\n+8\n+5\n-6\n"
-- "5"
--
mySolution :: String -> String
mySolution input = show $ findDuplicatedFreq ls
    where ls = cycle $ map parseSignedInt $ lines $ input

findDuplicatedFreq :: (Ord a, Num a, Eq a) => [a] -> a
findDuplicatedFreq xs = findDuplicatedFreq' xs 0 (Set.fromList [0])

findDuplicatedFreq' :: (Ord a, Num a, Eq a) => [a] -> a -> Set a -> a
findDuplicatedFreq' [] _ _ = 666
findDuplicatedFreq' (x:xs) acc pastFreqs
  | Set.member nextFreq pastFreqs = nextFreq
  | otherwise = findDuplicatedFreq' xs nextFreq (Set.insert nextFreq pastFreqs)
  where nextFreq = acc + x

parseSignedInt :: String -> Int
parseSignedInt [] = 0
parseSignedInt ('+':xs) = read xs
parseSignedInt xs = read xs
