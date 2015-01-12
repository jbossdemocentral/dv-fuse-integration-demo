package sa.demo.fuse.jdv.usecase2;

import java.util.List;

import org.apache.camel.Exchange;

public interface DVRouter {

	public abstract String buildQuery();

	public abstract String getQuery();

	public abstract void setQuery(String query);
	
	public abstract List<String> split(Exchange exchange);

}
