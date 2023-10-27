
import Foundation

extension String {
   
   public func convertDecimalEnterTextField() -> Decimal {
      let replace = self.replacingOccurrences(of: ",", with: ".")
      let result  = Decimal(string: replace) ?? 0
      return result
   }
   //Конвертируем из строки в Decimal и потом в строку но округленную до выбранной цыфры
   public func convertInDecimalRoundString(max: Int) -> String {
      let decimal = Decimal(string: self) ?? 0.0
      let round   = decimal.rounded(max, .up)
      let stringResult = NumberFormatter.amount(minimumFractionDigits: 1, maximumFractionDigits: max).string(from: round as NSNumber)!
      return stringResult
   }
}

