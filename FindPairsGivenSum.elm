module FindPairsGivenSum exposing (output)

{--
    Find all pairs of integers within an array which sum to a specified value.
    Plus: keep the order
    Time complexity: O(n)
-}

import Set


output : List String -> String
output _ =
    findPairsGivenSum [ 1, 2, 3, 5, 4, 7, 8, 10 ] 9 |> toString


findPairsGivenSum : List Int -> Int -> List ( Int, Int )
findPairsGivenSum nums sum =
    findPairsGivenSumHelper nums sum Set.empty []


findPairsGivenSumHelper : List Int -> Int -> Set.Set Int -> List ( Int, Int ) -> List ( Int, Int )
findPairsGivenSumHelper nums sum tempSet result =
    case nums of
        [] ->
            result

        h :: t ->
            if Set.member (sum - h) tempSet then
                findPairsGivenSumHelper t sum (Set.insert h tempSet) ([ ( sum - h, h ) ] ++ result)
            else
                findPairsGivenSumHelper t sum (Set.insert h tempSet) result
