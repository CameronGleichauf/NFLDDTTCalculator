# README

[NFL Draft Day Trade Tool Calculator application](https://nfl-78c46e35d347.herokuapp.com/)

This project creates an NFL Draft Day Trade Tool Calculator application that does the following:
- Minimum Features:
  - Show what picks the "starting" team has
  - Show what picks the “target” team has
  - Add up the value of the picks in a given trade offer and evaluate which team comes out ahead
    - Pick Value based on [Jimmy Johnson framework](https://www.nytimes.com/athletic/5426403/2024/04/25/nfl-draft-trade-value-chart-jimmy-johnson-explained/)
  - Save previous offers, so they can be compared to new offers (potentially from different teams)
- Additional Features:
  - Delete existing trades by team


## Tech Debt
- UI Improvements
  - Show trade calculator and teams view buttons on `one_team_selected` view 
  - Once `Save Trade` button is clicked, automatically bring team back to home page
- Code Cleanup

## Future Features
These are features that were not able to be included in this release, but would be of high priority for a future release. 
- Delete individual saved trades
- Execute trades (swap picks)
- Amend (but not delete) saves trades
- Prevent saving of duplicate trades
- Add a 3rd team
- Add future draft picks

## Code 
This project runs on [Ruby on Rails](https://rubyonrails.org/), a breakdown of relevant files can be found below:
- App
  - [Models](https://github.com/CameronGleichauf/NFLDDTTCalculator/tree/main/app/models)
    - Defines models that map to database tables and encapsulate business logic
  - [Views](https://github.com/CameronGleichauf/NFLDDTTCalculator/tree/main/app/views)
    - Defines views that map to different rendered pages within the application
  - [Controllers](https://github.com/CameronGleichauf/NFLDDTTCalculator/tree/main/app/controllers)
    - Defines controllers that route request from [routes.rb](https://github.com/CameronGleichauf/NFLDDTTCalculator/blob/main/config/routes.rb) and perform business logic/delegate to models
- Database
  - [schema.rb](https://github.com/CameronGleichauf/NFLDDTTCalculator/blob/main/db/schema.rb)
    - Defines Tables and Relationships
  - [seeds.rb](https://github.com/CameronGleichauf/NFLDDTTCalculator/blob/main/db/seeds.rb)
    - Idempotent code responsible for defining starting data necessary to run application
  - [jj_trade_value_chart.rb](https://github.com/CameronGleichauf/NFLDDTTCalculator/blob/main/db/jj_trade_value_chart.rb)
    - File that defines the Picks and their associated values based on the [Jimmy Johnson framework](https://www.nytimes.com/athletic/5426403/2024/04/25/nfl-draft-trade-value-chart-jimmy-johnson-explained/)

# Runbooking
## Reset Database 
- To reset the database and seed with initial values:
  - `rails db:drop`
  - `rails db:schema:load`    
  - `rails db:seed` 