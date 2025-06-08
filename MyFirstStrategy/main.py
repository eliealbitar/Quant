from AlgorithmImports import *

class MyFirstStrategy(QCAlgorithm):
    def Initialize(self):
        self.SetStartDate(2022, 1, 1)
        self.SetEndDate(2023, 1, 1)
        self.SetCash(100000)
        self.AddEquity("AAPL", Resolution.Daily)
        self.last_action = None

    def OnData(self, data: Slice):
        if not self.Portfolio.Invested and self.last_action != "buy":
            self.SetHoldings("AAPL", 1.0)
            self.last_action = "buy"
        elif self.Time.day % 10 == 0 and self.Portfolio.Invested:
            self.Liquidate("AAPL")
            self.last_action = "sell"
