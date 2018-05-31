-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.




module Duckling.FlightNumber.Helpers
  ( flightNumber
  ) where

import Data.Text (Text)
import qualified Data.Text as Text

import qualified Duckling.FlightNumber.Types as TFlightNumber
import Duckling.FlightNumber.Types (FlightNumberData(..))

-- -----------------------------------------------------------------
-- Patterns

-- -----------------------------------------------------------------
-- Production

flightNumber :: Text -> Text -> FlightNumberData
flightNumber airlineIata number = FlightNumberData
  {TFlightNumber.value = Text.concat [Text.toUpper airlineIata, number], TFlightNumber.airlineIata = Text.toUpper airlineIata, TFlightNumber.number = number}
