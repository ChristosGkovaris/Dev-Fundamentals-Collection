-------------------------------------------------------------------------------------------------------

factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n = n*factorial(n-1)

-------------------------------------------------------------------------------------------------------

number_in_range :: Int -> Int -> Int -> Bool
number_in_range min number max = number>=min && number<=max

-------------------------------------------------------------------------------------------------------

no_duplicates :: [Int] -> [Int]
no_duplicates [] = []
no_duplicates (h:i:t)
              | h==i = no_duplicates (h:t)
              | otherwise = h : no_duplicates t
no_duplicates s = s

-------------------------------------------------------------------------------------------------------

generate_list_boundaries :: Int -> Int -> [Int]
generate_list_boundaries first last
                         | first==last = [first]
                         | first<last = first : generate_list_boundaries (first+1) last
                         | otherwise = []

-------------------------------------------------------------------------------------------------------

sum_all_list_elems :: [Int] -> Int
sum_all_list_elems [] = 0
sum_all_list_elems (h:t) = h + sum_all_list_elems t

-------------------------------------------------------------------------------------------------------

delete_even_numbers_from_list :: [Int] -> [Int]
delete_even_numbers_from_list [] = []
delete_even_numbers_from_list (h:t)
                              | h `mod` 2==0 = h : delete_even_numbers_from_list t
                              | otherwise = delete_even_numbers_from_list t

-------------------------------------------------------------------------------------------------------

delete_odd_numbers_from_list :: [Int] -> [Int]
delete_odd_numbers_from_list [] = []
delete_odd_numbers_from_list (h:t)
                              | h `mod` 2==1 = h : delete_odd_numbers_from_list t
                              | otherwise = delete_odd_numbers_from_list t

-------------------------------------------------------------------------------------------------------

element_existance_inside_list :: [Int] -> Int -> Bool
element_existance_inside_list [] _ = False
element_existance_inside_list (h:t) number
                              | h==number = True
                              | otherwise = element_existance_inside_list t number

-------------------------------------------------------------------------------------------------------

is_list_sorted_ascending :: [Int] -> Bool
is_list_sorted_ascending [] = True
is_list_sorted_ascending [_] = True
is_list_sorted_ascending (h:i:t)
                         | h<=i = is_list_sorted_ascending t
                         | otherwise = False

-------------------------------------------------------------------------------------------------------

is_list_sorted_descending :: [Int] -> Bool
is_list_sorted_descending [] = True
is_list_sorted_descending [_] = True
is_list_sorted_descending (h:i:t)
                         | h>i = is_list_sorted_descending t
                         | otherwise = False
        
-------------------------------------------------------------------------------------------------------

generating :: (Int -> Double) -> Int -> (Double -> Double)
generating f k = \z-> helpGen f k z

helpGen :: (Int -> Double) -> Int -> (Double -> Double)
helpGen f (-1) z = 0
helpGen f k z = (f k)*z^k + helpGen f (k-1) z

-------------------------------------------------------------------------------------------------------

mapi :: [u]->(u->Int->v)->[v]
mapi s f = maps s f 1

maps :: [u]->(u->Int->v)->Int->[v]
maps (h:[]) f i = (f h i):[]
maps (h:t) f i =(f h i):(maps t f (i+1))

-------------------------------------------------------------------------------------------------------

integral_higher_order :: (Double->Double) -> Double -> Double -> Double -> Double
integral_higher_order f a b d
                      | c<=d = c*(((f a)+(f b))/2)
                      | otherwise = integral_higher_order f a n d + integral_higher_order f n b d

                      where c=(b-a)
                            n=(a+((b-a)/2))

-------------------------------------------------------------------------------------------------------

check_element :: [Int] -> Int -> Bool
check_element [] _ = False
check_element [x] _ = False
check_element (h:i:t) pos
              | h<i && pos==1 = True
              | otherwise = check_element (i:t) pos

-------------------------------------------------------------------------------------------------------

check_element_given_number :: [Int] -> Int -> Int -> Bool
check_element_given_number [] _ _ = False
check_element_given_number (h:i:t) pos number
              | h<number = True
              | otherwise = check_element_given_number t pos number

-------------------------------------------------------------------------------------------------------
