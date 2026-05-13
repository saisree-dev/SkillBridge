using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SkillBridgeAPI.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SkillBridgeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly AppDbContext _context;

        // This links your Controller to the Database Context
        public RolesController(AppDbContext context)
        {
            _context = context;
        }

        // 1. Existing GET method to fetch roles from your SQL Database
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Role>>> GetRoles()
        {
            var rolesWithSkills = await _context.Roles
        .Include(r => r.RoleSkills)
            .ThenInclude(rs => rs.Skill)
        .Select(r => new {
            r.RoleId,
            r.RoleName,
            Skills = r.RoleSkills.Select(rs => rs.Skill.SkillName).ToList()
        })
        .ToListAsync();

    return Ok(rolesWithSkills);
        }

        // 2. NEW POST method to analyze the skill gap
        [HttpPost("analyze")]
        public IActionResult Analyze([FromBody] AnalysisRequest request)
        {
            // Define required skills for each role
            var roleRequirements = new Dictionary<string, List<string>>
            {
                { "frontend", new List<string> { "HTML", "CSS", "JavaScript", "React" } },
                { "backend", new List<string> { "Node.js", "JavaScript", "DSA" } },
                { "embedded", new List<string> { "C", "Microcontrollers" } }
            };

            // Basic validation
            if (request == null || string.IsNullOrEmpty(request.Roles))
            {
                return BadRequest("Invalid request data.");
            }

            string roleKey = request.Roles.ToLower();

            if (!roleRequirements.ContainsKey(roleKey))
            {
                return BadRequest("Role not found in analyzer.");
            }

            var required = roleRequirements[roleKey];
            
            // Compare user skills with required skills (case-insensitive)
            var matched = request.Skill
                .Intersect(required, StringComparer.OrdinalIgnoreCase)
                .ToList();
                
            var missing = required
                .Except(request.Skill, StringComparer.OrdinalIgnoreCase)
                .ToList();

            // Calculate percentage
            int percentage = (int)Math.Round((double)matched.Count / required.Count * 100);

            // Determine roadmap message
            string roadmap = percentage < 50 
                ? "Beginner Level: Focus on learning the fundamentals first." 
                : (percentage < 80 ? "Intermediate Level: Improve advanced concepts." : "Advanced Level: Practice projects & interviews.");

            // Return JSON response to Angular
            return Ok(new 
            {
                percentage = percentage,
                matched = matched,
                missing = missing,
                roadmap = roadmap
            });
        }
    }

    // This class defines the data structure Angular will send to the API
    public class AnalysisRequest
    {
        public string ?Roles { get; set; }
        public List<string>? Skill { get; set; }
    }
}
