class widget;
  int id;
  bit to_remove;
endclass : widget

//module top;
  widget q[$];
  int to_remove_idx[$];
  widget wo_to_remove_q[$];

  initial begin
    widget w;
    int num = $urandom_range(20,40);
    for (int i = 0; i < num; i++) begin
      w = new;
      w.id = i;
      w.to_remove = $urandom_range(0,1);
      q.push_back(w);
      $display("widget id:%02d, to_remove:%b", q[$].id, q[$].to_remove);
    end
    $display("--------------------------------------------------");
    // write SV code to remove entries in q[$] that have to_remove==1
    //for(int i=0; i < q.size(); i++ ) begin
    for(int i=q.size()-1; i >=0; i-- ) begin
     // method 1 
      //if( !q[i].to_remove ) begin
      //  wo_to_remove_q.push_back(q[i]); 
      //end else $display("Idx has to_removed :%0d", i );
      
      $display("Qsize :%0d Idx :%0d", q.size()-1, i );
      // Method 2 
      if( q[i].to_remove ) begin
        $display("Idx has to_removed :%0d", i );
         q.delete(i);
      //    i--;
      end //else $display("Idx has not to_removed :%0d", i );
      //end
      
      //Method - 3 
      
    end
    
     
    
   // foreach(wo_to_remove_q[i]) begin
      foreach(q[i]) begin
      $display("Idx has to_removed :%0d", q[i].to_remove );
    end 
   
    
    // write SV code to check that no entry in q[$] has to_remove==1
    
  end
//endmodule