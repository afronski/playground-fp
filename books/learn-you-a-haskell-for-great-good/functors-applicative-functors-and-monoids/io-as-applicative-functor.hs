import Control.Applicative

-- Look at this beauty:
--
--   It creates a composed operation which will wait on I/O. It will be lazily
--   evaluated after the actual work which involved time wil end.

main = do
    lines <- (++) <$> getLine <*> getLine
    putStrLn $ "The two lines concatenated turn out to be: " ++ lines
