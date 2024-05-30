# README

This project creates an NFL Draft Day Trade Tool Calculator application that does the following:
- Shows each pick and individual value for "starting" team
- Shows each pick and individual value for "target" team
- Shows total cumulative picks for each team
- Shows total cumulative value of picks based on [Jimmy Johnson framework](https://www.nytimes.com/athletic/5426403/2024/04/25/nfl-draft-trade-value-chart-jimmy-johnson-explained/)
- Enables trading between teams


## Minimum Features still in Development:
- Update each teams current draft picks based on completed trades
- Add value of picks in a given trade offer to evaluate which team came ahead
- Save previous offers to compare to new offers

## Tech Debt
- Update JJ framework 
- UI Improvements
- Code Cleanup
- Creating database in prod environment
- Deployment for live consumption
- Testing

## Nice To Have Features:
- Execute Trades (swap picks)
- Add a 3rd team
- Add future draft picks
- Amend Saved Trades
- Prevent Saving of Duplicate Trades 

# Runbooking
## Reset Database 
- To reset the database and seed with initial values:
  - `rails db:drop`
  - `rails db:schema:load`    
  - `rails db:seed` 