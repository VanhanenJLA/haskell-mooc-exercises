import Data.Char

validate :: String -> Bool
validate iban
    | not $ validateLength iban = False
    | not $ validateStartsWithCountryCode iban = False
    | not $ all isDigit (drop 2 iban) = False
    | otherwise = True

validateLength :: Foldable t => t a -> Bool
validateLength iban = length iban == 18
validateStartsWithCountryCode :: [Char] -> Bool
validateStartsWithCountryCode iban = take 2 iban == "FI"

main :: IO ()
main = do 
    validate "FI4950009420028730"
    return ()
