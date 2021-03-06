package ca.wilkinsonlab.utils;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import ca.wilkinsonlab.utils.URIUtils;


public class URIUtilsTest 	
{
	@Test
	public void testGetURIPrefix() 
	{
		assertTrue(URIUtils.getURIPrefix("http://something.com/part1/part2").equals("http://something.com/part1/"));
		assertTrue(URIUtils.getURIPrefix("http://something.com/part1/part2/").equals("http://something.com/part1/"));
		assertTrue(URIUtils.getURIPrefix("alongstringwithnodelimiterchars#").equals("alongstringwithnodelimiterchars#"));
	}
}
