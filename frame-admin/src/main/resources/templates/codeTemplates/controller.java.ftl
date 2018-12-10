package ${package.Controller};

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
import com.frame.util.Query;
import com.frame.util.R;
import com.frame.validator.ValidatorUtils;
import com.frame.validator.group.AddGroup;
import com.frame.validator.group.UpdateGroup;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
import ${package.ServiceImpl}.${table.serviceImplName};
import ${package.Entity}.${entity};



/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
 
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
<#assign className = table.controllerName?replace("Controller", "") />
<#assign classname = className?lower_case>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${classname}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

	private static final Logger logger = LoggerFactory.getLogger(${table.controllerName}.class);

	@Autowired
	private ${table.serviceImplName} ${table.serviceImplName?uncap_first};
	
	/**
	 * 新增
	 * @param ${table.entityName}
	 * @return R.ok()
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public R save(@RequestBody ${table.entityName} ${table.entityName?uncap_first}) {
		ValidatorUtils.validateEntity(${table.entityName?uncap_first}, AddGroup.class);
		${table.serviceImplName?uncap_first}.save(${table.entityName?uncap_first});
		return R.ok();
	}
	
	/**
	 * 删除
	 * @param id
	 * @return R.ok()
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public R delete(@PathVariable("id") Long id) {
		${table.serviceImplName?uncap_first}.removeById(id);
		return R.ok();
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteBatchByIds", method = RequestMethod.POST)
	public R deleteBatchByIds(@RequestBody List<String> ids) {
		${table.serviceImplName?uncap_first}.removeByIds(ids);
		return R.ok();
	}
	
	/**
	 * 修改
	 * @param ${table.entityName}
	 * @return R.ok()
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public R update(@RequestBody ${table.entityName} ${table.entityName?uncap_first}) {
		ValidatorUtils.validateEntity(${table.entityName?uncap_first}, UpdateGroup.class);
		${table.serviceImplName?uncap_first}.updateById(${table.entityName?uncap_first});
		return R.ok();
	}
	
	/**
	 * 查询
	 * @param id
	 * @return R.ok().put("${classname}", ${table.entityName?uncap_first})
	 */
	@RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
	public R info(@PathVariable("id") String id) {
		${table.entityName} ${table.entityName?uncap_first} = ${table.serviceImplName?uncap_first}.getById(id);
		return R.ok().put("${classname}", ${table.entityName?uncap_first});
	}
	
	/**
	 * 分页查询
	 * @param params
	 * @return R.ok().put("page", pageInfo);
	 */
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public R page(@RequestParam Map<String, Object> params) {
		Query query = new Query(params);
		PageHelper.startPage(query.getPage(), query.getLimit());
		PageInfo<${table.entityName}> pageInfo = new PageInfo<${table.entityName}>(${table.serviceImplName?uncap_first}.queryPage(query));
		return R.ok().put("page", pageInfo);
	}

}
</#if>
