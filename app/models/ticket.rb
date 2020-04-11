class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  validates :order, presence: true

  # TODO: complete the folowing
  before_create :update_stats
  after_destroy :destroy_stats

  private
  def update_stats
    es = self.ticket_type.event.event_stat
    begin
      if self.ticket_type.event.event_venue.capacity == es.tickets_sold
        raise 'Error: tickets are sold out'
      end
      es.update(tickets_sold: es.tickets_sold + 1)
      es.update(tickets_sold: es.attendance + 1)
      puts 'Updated ticket_sold and attendance'
    end
  end

  def destroy_stats
    es = self.ticket_type.event.event_stat
    es = self.ticket_type.event.event_stat
    es.update(tickets_sold: es.attendance - 1)
    es.update(tickets_sold: es.tickets_sold - 1)
    puts 'Destroyed ticket'
  end
end
