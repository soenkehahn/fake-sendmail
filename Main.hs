

import System.Environment
import Data.Monoid
import System.IO


main :: IO ()
main = do
    args <- getArgs
    output ("arguments: " <> show args <> "\n")
    output . ("stdin: " <>) =<< hGetContents stdin

output :: String -> IO ()
output s = do
    hPutStr stderr s
    appendFile "/tmp/fake-sendmail-log" s
