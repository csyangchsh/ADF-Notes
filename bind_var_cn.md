# VO中的绑定变量
View Object中的Bind Variable有2种类型：  

1. viewcriteria
  
    `<Variable Name="pFirstName" Kind="viewcriteria" Type="java.lang.String"/>`
    
使用在View Criteria中，一般标记为Optional。如果需要设置为必填项，可以在View Criteria Item中将Valdation设置成Required。

2. where

	`<Variable Name="pEmail" Kind="where" Type="java.lang.String">`
	
定义在VO的query中，需要标记为Required。

**如果Bind Variable设置成Required，在Search Panel中，会显现成单独的Field，可以通过设置Display Hint隐藏。**

在点击页面上Search Panel的Reset按钮时，where类型的Bind Variable是无法清空的。需要在Backing Bean中实现自己的的queryOperationListener，示例代码如下：

    public void processQueryOperation(QueryOperationEvent queryOperationEvent) {
    
        FacesContext fc = FacesContext.getCurrentInstance(); 
        ELContext elctx = fc.getELContext();
        ExpressionFactory elFactory = fc.getApplication().getExpressionFactory(); 
          MethodExpression methodExpr = 
    elFactory.createMethodExpression(elctx,"#{bindings.EmployeesVOViewCriteriaQuery.processQueryOperation}",
        Object.class,new Class[]{QueryEvent.class}); 
        methodExpr.invoke(elctx,new Object[]{queryOperationEvent});   
     
        if (queryOperationEvent.getOperation().name().equalsIgnoreCase("RESET")) {
            DCBindingContainer bc = (DCBindingContainer)this.getBindings();
            DCIteratorBinding dcIb = bc.findIteratorBinding("EmployeesView1Iterator");
            ViewObject vo = dcIb.getViewObject();
            vo.ensureVariableManager().clearValue("lastName");            
        } 
    }