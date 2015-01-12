package sa.demo.fuse.jdv.usecase2;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.camel.Exchange;

/**
 * A bean which we use in the route
 */
public class DVRouterBean implements DVRouter {

    private String query = "select * from CustomerContextView.CustomerContext;";

    /* (non-Javadoc)
	 * @see sa.demo.fuse.dvroute.DVRouter#buildQuery()
	 */
    @Override
	public String buildQuery() {
        // SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // return query + " at " + sdf.format(new Date());
    	return query;
    }

    /* (non-Javadoc)
	 * @see sa.demo.fuse.dvroute.DVRouter#getSay()
	 */
    @Override
	public String getQuery() {
        return query;
    }

    /* (non-Javadoc)
	 * @see sa.demo.fuse.dvroute.DVRouter#setSay(java.lang.String)
	 */
    @Override
	public void setQuery(String query) {
        this.query = query;
    }

	@Override
	public List<String> split(Exchange exchange) {
		// TODO Auto-generated method stub
		ArrayList<String> rs = (ArrayList<String>)exchange.getIn().getBody(ArrayList.class);
		return rs;
	}
    
    
}
