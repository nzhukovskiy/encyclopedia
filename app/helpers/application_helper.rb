module ApplicationHelper
  def less_text(txt, n)
    if txt != nil

      t = txt[0...n].strip()
      t+="..." if txt.length>n
      return t

    end
  end

  def year_helper(year)
    if year % 10 == 1
      return "год"
    elsif year % 10 > 1 and year % 10 < 5
      return "года"
    else
      return "лет"
    end
  end
end
