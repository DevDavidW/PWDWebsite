using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DetailsView1.FindControl("txtName").Focus();
    }

    protected void RefreshBtn_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        DetailsView dv = (DetailsView)sender;
        if (dv.CurrentMode == DetailsViewMode.Insert) {
            getNextCarNumber_Click(dv, e);
        }
    }

    protected void getNextCarNumber_Click(object sender, EventArgs e)
    {
        TextBox txtCar = (TextBox)DetailsView1.FindControl("txtCar");
        DataView view = (DataView)PinewoodNextCar.Select(DataSourceSelectArguments.Empty);

        if (view.Count > 0)
            if (view[0][0].ToString() == String.Empty)
                txtCar.Text = "1";
            else
                txtCar.Text = view[0][0].ToString();
        else
            txtCar.Text = "1";

    }
}