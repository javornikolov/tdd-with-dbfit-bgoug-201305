package com.objectmentor.fixtures;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

public class TestCommandLineFixture {

  private CommandLineFixture f;

  @Before
  public void setUp() throws Exception {
    f = new CommandLineFixture();
  }

  @Test
  public void testDefinitions() throws Exception {
    f.doDefinition("BOB", "Robert");
    String replaced = f.replaceDefinitions("Hi BOB");
    assertEquals("Hi Robert", replaced);
  }

  @Test
  public void testTwoReplacements() throws Exception {
    f.doDefinition("BOB", "Robert");
    String replaced = f.replaceDefinitions("BOB, please meet BOB. Pleased to meet you BOB.");
    assertEquals("Robert, please meet Robert. Pleased to meet you Robert.", replaced);
  }

  @Test
  public void testMultipleDefinitions() throws Exception {
    f.doDefinition("BOB", "Robert");
    f.doDefinition("TIM", "Timothy");
    String replaced = f.replaceDefinitions("BOB and TIM went up the hill. BOB and TIM went down.");
    assertEquals("Robert and Timothy went up the hill. Robert and Timothy went down.", replaced);
  }

  @Test
  public void testNextedMacros() throws Exception {
    f.doDefinition("BOB","ROBERT");
    f.doDefinition("ROBERT","ANN");
    f.doDefinition("ANN", "Cecil");
    String replaced = f.replaceDefinitions("BOB BOB BOB");
    assertEquals("Cecil Cecil Cecil", replaced);
  }

  @Test
  public void testUnescape() throws Exception {
    assertEquals("Unescape", "Hello \"Bob\".", CommandLineFixture.unescape("Hello &quot;Bob&quot;.","&quot;","\""));
  }
}

