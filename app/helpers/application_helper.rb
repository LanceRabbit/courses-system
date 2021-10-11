module ApplicationHelper
  def flash_class(level)
    bootstrap_alert_class = {
      success: "alert-success",
      error: "alert-danger",
      notice: "alert-info",
      alert: "alert-danger",
      warn: "alert-warning"
    }

    bootstrap_alert_class[level.to_sym]
  end

  def currencies
    CoursesSystemConfig::CURRENCY.map do |currency|
      [currency, currency]
    end
  end
end
