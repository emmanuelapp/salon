module BookingsHelper
  def reserved_at_dropdown(form_builder)
    form_builder.datetime_select :reserved_at,
                                 reserved_at_options,
                                 reserved_at_html_options
  end

  def reserved_at_options
    {
      order: [:day, :month, :year],
      start_year: Time.now.year,
      end_year: Time.now.year + 1,
      prompt: reserved_at_prompt,
      datetime_separator: '',
      time_separator: '',
      minute_step: 15
    }
  end

  def reserved_at_prompt
    {
      day: t(:select_day),
      month: t(:select_month),
      year: t(:select_year),
      hour: t(:select_hour),
      minute: t(:select_minute)
    }
  end

  def reserved_at_html_options
    {
      class: 'form-control',
      required: true
    }
  end

  def full_name(booking)
    "#{booking.first_name} #{booking.last_name}"
  end
end
