module ApplicationHelper
  def vehicle_icon(type)
    case type.to_sym
    when :hover_bus
      "🚌"
    when :hover_taxi
      "🚕"
    when :advanced_train
      "🚄"
    when :teleport_chamber
      "✨"
    else
      "🚗"
    end
  end
  
  def status_badge_color(status)
    case status.to_sym
    when :pending, :unpaid
      "bg-yellow-500/20 border border-yellow-500 text-yellow-400"
    when :confirmed, :paid
      "bg-green-500/20 border border-green-500 text-green-400"
    when :in_progress
      "bg-blue-500/20 border border-blue-500 text-blue-400"
    when :completed
      "bg-purple-500/20 border border-purple-500 text-purple-400"
    when :cancelled, :refunded
      "bg-red-500/20 border border-red-500 text-red-400"
    else
      "bg-slate-500/20 border border-slate-500 text-slate-400"
    end
  end
end
