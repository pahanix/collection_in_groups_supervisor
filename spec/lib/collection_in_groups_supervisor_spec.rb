require File.dirname(__FILE__) + "/../../lib/collection_in_groups_supervisor"

describe CollectionInGroupsSupervisor do
  before(:all) do

    # 2 Tables
    # 3 Rows
    # 4 Cells
    
    collection = [ 
       0,  1,  2,  3, 
       4,  5,  6,  7,
       8,  9, 10, 11,
       
      12, 13, 14, 15,
      16, 17, 18, 19,
      20, 21, 22, 23      
    ]    

    @supevisor = CollectionInGroupsSupervisor.new(collection.size, 2, 3, 4)
  end
  
  [*0..23].each do |index|
     
    it "#counter should equal index:#{index}" do
      @supevisor.counter.should == index
    end
    
    if [0, 12].include?(index)
      it "#next_table? should be true for index:#{index}" do 
        @supevisor.next_table?.should be_true
      end
    else
      it "#next_table?should be false for index:#{index}" do
        @supevisor.next_table?.should be_false
      end
    end

    if [*0..11].include?(index)
      it "#table should be 1 for index:#{index}" do
        @supevisor.table.should == 0
      end
    else
      it "#table should be 2for index:#{index}" do
        @supevisor.table.should == 1
      end
    end

    if [0, 1, 2, 3, 12, 13, 14, 15].include?(index)
      it "#row should be 1 for index:#{index}" do
        @supevisor.row.should == 0
      end
    elsif [4, 5, 6, 7, 16, 17, 18, 19].include?(index)
      it "#row should be 2 for index:#{index}" do
        @supevisor.row.should == 1
      end
    else
      it "#row should be 3 for index:#{index}" do
        @supevisor.row.should == 2
      end
    end      
      
    if [0, 4, 8, 12, 16, 20].include?(index)
      it "#next_row? should be true for index: #{index}" do
        @supevisor.next_row?.should be_true
      end
    else
      it "#next_row? should be false for index:#{index}" do
        @supevisor.next_row?.should be_false
      end
    end
          
    it "#next_cell? should be true for index:#{index}" do
     @supevisor.next_cell?.should be_true               
   end
   
    it "#next_item! should increase counter" do
      @supevisor.next_item!
      @supevisor.counter.should == index + 1
    end
  end
  
end