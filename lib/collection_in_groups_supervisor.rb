class CollectionInGroupsSupervisor
  
  attr_reader :table, :row, :cell, :counter
  
  def initialize(items_total, tables_total, rows_total, cells_total = 1)
    @counter = 0
    
    @table, @row, @cell = 0, 0, 0
    
    @items_total  = items_total
    @tables_total = tables_total
    @rows_total   = rows_total
    @cells_total  = cells_total
  end
  
  def next_table?
    @counter % (@rows_total * @cells_total) == 0
  end
  
  def next_row?
    @counter % @cells_total == 0
  end
    
  def next_cell?
    true
  end 
  
  def next_item!
    @counter += 1
    
    @cell += 1 if next_cell?

    if next_row?
      @cell = 0
      @row += 1 
    end
    
    if next_table?    
      @row    = 0
      @table += 1 
    end
  end
  
  def inspect
    "#<CollectionInGroupsSupervisor:#{object_id.to_s(32)} counter: #{@counter}, table: #{@table}, row: #{@row}, cell: #{@cell}>"
  end
  
  def to_s
    inspect
  end
end