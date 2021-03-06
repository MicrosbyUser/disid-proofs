package org.springframework.roo.entityformat.web;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooLinkFactory;
import org.springframework.util.Assert;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

import java.util.Map;

/**
 * = PetsItemVisitsThymeleafLinkFactory
 *
 * TODO Auto-generated class documentation
 *
 */
@RooLinkFactory(controller = PetsItemVisitsThymeleafController.class)
public class PetsItemVisitsThymeleafLinkFactory {


  /**
   * TODO Auto-generated attribute documentation
   */
  private static final String CREATE_FORM = "createForm";

  /**
   * TODO Auto-generated attribute documentation
   */
  private static final String CREATE = "create";

  /**
   * TODO Auto-generated attribute documentation
   */
  private static final String DATATABLES = "datatables";

  /**
   * TODO Auto-generated method documentation
   * 
   * @param methodName
   * @param parameters
   * @param pathVariables
   * @return UriComponents
   */
  public UriComponents toUri(String methodName, Object[] parameters,
      Map<String, Object> pathVariables) {
    Assert.notEmpty(pathVariables, "PetsItemVisitsThymeleafController links need at least "
        + "the Pet id Path Variable with the 'pet' key");

    Assert.notNull(pathVariables.get("pet"),
        "PetsItemVisitsThymeleafController links need at least "
            + "the Pet id Path Variable with the 'pet' key");

    if (methodName.equals(CREATE_FORM)) {
      return MvcUriComponentsBuilder
          .fromMethodCall(MvcUriComponentsBuilder.on(getControllerClass()).createForm(null, null))
          .buildAndExpand(pathVariables);
    }
    if (methodName.equals(CREATE)) {
      return MvcUriComponentsBuilder
          .fromMethodCall(MvcUriComponentsBuilder.on(getControllerClass()).create(null, null, null))
          .buildAndExpand(pathVariables);
    }
    if (methodName.equals(DATATABLES)) {
      return MvcUriComponentsBuilder
          .fromMethodCall(
              MvcUriComponentsBuilder.on(getControllerClass()).datatables(null, null, null, null,
                  null))
          .buildAndExpand(pathVariables);
    }

    throw new IllegalArgumentException("Invalid method name: " + methodName);
  }


}
