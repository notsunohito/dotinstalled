import Shapes

-- main = do
--   print $ Circle (Point 10 20) 30

-- => Main.hs:4:11: Not in scope: data constructor `Circle'
-- => Main.hs:4:19: Not in scope: data constructor `Point'

main = do
  print $ nudge (baseCircle 30) 10 20
