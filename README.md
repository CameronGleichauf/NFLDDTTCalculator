# README

[NFL Draft Day Trade Tool Calculator application](https://nfl-78c46e35d347.herokuapp.com/)

This project creates an NFL Draft Day Trade Tool Calculator application that does the following:
- Minimum Features:
  - Show what picks the "starting" team has
  - Show what picks the “target” team has
  - Add up the value of the picks in a given trade offer and evaluate which team comes out ahead
    - Pick Value based on [Jimmy Johnson framework](https://www.nytimes.com/athletic/5426403/2024/04/25/nfl-draft-trade-value-chart-jimmy-johnson-explained/)
  - Save previous offers so they can be compared to new offers (potentially from different teams)
- Additional Features:
  - Clear existing trades by team


## Minimum Features still in Development:
- Update each teams current draft picks based on completed trades
- Add value of picks in a given trade offer to evaluate which team came ahead
- Save previous offers to compare to new offers

## Tech Debt
- Update JJ framework 
- UI Improvements
  - Show trade calculator and teams view buttons on `one_team_selected` view 
  - Once `Save Trade` button is clicked, automatically bring team back to home page
- Code Cleanup

## Future Features
- Execute Trades (swap picks)
- Amend (but not delete) Saved Trades
- Prevent Saving of Duplicate Trades
- Add a 3rd team
- Add future draft picks

# Runbooking
## Reset Database 
- To reset the database and seed with initial values:
  - `rails db:drop`
  - `rails db:schema:load`    
  - `rails db:seed` 