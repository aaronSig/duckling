-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Duckling.FlightNumber.Rules
  ( rules ) where

import Prelude
import Data.String

import Duckling.Dimensions.Types
import Duckling.Regex.Types
import Duckling.Types
import Duckling.FlightNumber.Helpers

ruleFlightNumber :: Rule
ruleFlightNumber = Rule
  { name = "flightNumber"
  , pattern =
    [ regex $
            "([A-Z]{2,3}|[A-Z][0-9]|[0-9][A-Z])"++ -- Iata / ICAO Code
            "[\\s]?"++ -- Optional Space
            "([0-9]{1,4})"  -- Flight Number
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (_airline_iata:_flight_number:_)):_) -> 
        Just . Token FlightNumber $ flightNumber _airline_iata _flight_number
      _ -> Nothing
  }

rules :: [Rule]
rules =
  [ ruleFlightNumber ]
