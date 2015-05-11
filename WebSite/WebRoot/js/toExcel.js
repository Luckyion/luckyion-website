function CellAreaExcel()    
 {   
  var oXL = new ActiveXObject("Excel.Application"); 
    var oWB = oXL.Workbooks.Add(); 
    var oSheet = oWB.ActiveSheet; 
    var sel=document.body.createTextRange();
    //PrintA 是要到处的table名称
    sel.moveToElementText(PrintA);
    sel.select();
    sel.execCommand("Copy");
    oSheet.Paste();
    oXL.Visible = true;
 } 