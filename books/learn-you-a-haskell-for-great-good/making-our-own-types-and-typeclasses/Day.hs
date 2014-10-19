module Day (
  Day(..)
) where 

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday   
           deriving (Eq, Ord, Show, Read, Bounded, Enum) 

endOfTheWeek = [ Thursday .. Sunday ]
weekend = [ Saturday .. Sunday ]

readSunday = read "Sunday" :: Day
smallestDay = minBound :: Day

afterMonday = succ Monday
