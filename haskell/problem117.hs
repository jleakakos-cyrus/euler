-- Problem 117

problem117 = 1 + triples + doubles + singles

total = 50

triples = sum $ tripleNums total 2 3 4

tripleNums n c1 c2 c3 = [(fact (black + cc1 + cc2 + cc3)) `div` ((fact black) * (fact cc1) * (fact cc2) * (fact cc3)) | cc1 <- [1..n`div`c1], cc2 <- [1..n`div`c2], cc3 <- [1..n`div`c3], let black = (n - c1*cc1 - c2*cc2 - c3*cc3), n-(black+cc1+cc2+cc3) >= 0, black >= 0]

doubles = (sum (doubleNums total 2 3)) + (sum (doubleNums total 2 4)) + (sum (doubleNums total 3 4))

doubleNums n c1 c2 = [(fact (black + cc1 + cc2)) `div` ((fact black) * (fact cc1) * (fact cc2))| cc1 <- [1..n`div`c1], cc2 <- [1..n`div`c2], let black = (n - c1*cc1 - c2*cc2), n-(black+cc1+cc2) >= 0, black >= 0]

singles = sum $ map (nums total) [2,3,4]

nums n c = sum [(fact (black + cc)) `div` ((fact cc) * (fact black)) | cc <- [1..n`div`c], let black = (n-c*cc)]

fact = (\x -> product [1..x])