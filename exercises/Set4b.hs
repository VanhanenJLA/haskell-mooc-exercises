-- Exercise set 4b: folds
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant lambda" #-}

module Set4b where

import Mooc.Todo

------------------------------------------------------------------------------
-- Ex 1: countNothings with a fold. The function countNothings from
-- the course material can be implemented using foldr. Your task is to
-- define countHelper so that the following definition of countNothings
-- works.
--
-- Hint: You can start by trying to add a type signature for countHelper.
--
-- Challenge: look up the maybe function and use it in countHelper.
--
-- Examples:
--   countNothings []  ==>  0
--   countNothings [Just 1, Nothing, Just 3, Nothing]  ==>  2

countNothings :: [Maybe a] -> Int
countNothings = foldr countHelper 0

countHelper :: Maybe a -> Int -> Int
countHelper = \cur acc ->
  case cur of
    Nothing -> acc + 1
    Just _ -> acc

------------------------------------------------------------------------------
-- Ex 2: myMaximum with a fold. Just like in the previous exercise,
-- define maxHelper so that the given definition of myMaximum works.
--
-- Examples:
--   myMaximum []  ==>  0
--   myMaximum [1,3,2]  ==>  3

myMaximum :: [Int] -> Int
myMaximum [] = 0
myMaximum (x : xs) = foldr maxHelper x xs

maxHelper :: Int -> Int -> Int
maxHelper = max

------------------------------------------------------------------------------
-- Ex 3: compute the sum and length of a list with a fold. Define
-- slHelper and slStart so that the given definition of sumAndLength
-- works. This could be used to compute the average of a list.
--
-- Start by giving slStart and slHelper types.
--
-- Examples:
--   sumAndLength []             ==>  (0.0,0)
--   sumAndLength [1.0,2.0,4.0]  ==>  (7.0,3)

sumAndLength :: [Double] -> (Double, Int)
sumAndLength = foldr slHelper slStart

slStart :: (Double, Int)
slStart = (0, 0)

slHelper :: (Num a, Num b) => a -> (a, b) -> (a, b)
slHelper current (sum, length) = (current + sum, length + 1)

------------------------------------------------------------------------------
-- Ex 4: implement concat with a fold. Define concatHelper and
-- concatStart so that the given definition of myConcat joins inner
-- lists of a list.
--
-- Examples:
--   myConcat [[]]                ==> []
--   myConcat [[1,2,3],[4,5],[6]] ==> [1,2,3,4,5,6]

myConcat :: [[a]] -> [a]
myConcat = foldr concatHelper concatStart

concatStart :: [a]
concatStart = []

concatHelper :: [a] -> [a] -> [a]
concatHelper a b = a ++ b

------------------------------------------------------------------------------
-- Ex 5: get all occurrences of the largest number in a list with a
-- fold. Implement largestHelper so that the given definition of largest works.
--
-- Examples:
--   largest [] ==> []
--   largest [1,3,2] ==> [3]
--   largest [1,3,2,3] ==> [3,3]

largest :: [Int] -> [Int]
largest = foldr largestHelper []

largestHelper :: Ord a => a -> [a] -> [a]
largestHelper cur [] = [cur]
largestHelper cur acc
  | cur > head acc = [cur]
  | cur == head acc = cur : acc
  | otherwise = acc

------------------------------------------------------------------------------
-- Ex 6: get the first element of a list with a fold. Define
-- headHelper so that the given definition of myHead works.
--
-- Start by giving headHelper a type.
--
-- Examples:
--   myHead []  ==>  Nothing
--   myHead [1,2,3]  ==>  Just 1

myHead :: [a] -> Maybe a
myHead = foldr headHelper Nothing

headHelper :: a -> p -> Maybe a
headHelper cur _ = Just cur

------------------------------------------------------------------------------
-- Ex 7: get the last element of a list with a fold. Define lasthelper
-- so that the given definition of myLast works.
--
-- Start by giving lastHelper a type.
--
-- Examples:
--   myLast [] ==> Nothing
--   myLast [1,2,3] ==> Just 3

myLast :: [a] -> Maybe a
myLast = foldr lastHelper Nothing

lastHelper :: a -> Maybe a -> Maybe a
lastHelper cur Nothing = Just cur
lastHelper _ acc = acc